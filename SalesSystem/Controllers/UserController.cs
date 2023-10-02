using Microsoft.AspNetCore.Mvc;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Permission;
using System.Net;

namespace SalesSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IWorkContainer _workContainer;
        private readonly APIResponseDTO _response;

        public UserController(IWorkContainer workContainer)
        {
            _workContainer = workContainer;
            _response = new();
        }

        [Permission]
        [HttpGet("GetUsers")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        public async Task<IActionResult> GetUsers()
        {
            try
            {
                List<UserDTO> userList = await _workContainer.User.UsersList();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = userList;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }

        }


        [HttpPost("Login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> Login([FromBody] LoginRequestDTO modelo)
        {
            try
            {
                LoginResponseDTO loginResponse = await _workContainer.User.ValidCredentials(modelo);
                if (loginResponse.Usuario == null || string.IsNullOrEmpty(loginResponse.Token))
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add("UserName o Password son Incorrectos");
                    return BadRequest(_response);
                }
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = loginResponse;

                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }

        }

        [Permission]
        [HttpPost("AddUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        public async Task<IActionResult> AddUser([FromBody] UserDTO modelo)
        {
            if (!ModelState.IsValid)
            {
                _response.StatusCode = HttpStatusCode.BadRequest;
                _response.IsExitoso = false;
                _response.ErrorMessages.Add("Error in model");
                return BadRequest(_response);
            }

            try
            {
                bool isUsuarioUnico = await _workContainer.User.IsUniqueUser(modelo.Email);

                if (!isUsuarioUnico)
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add("Usuario ya Existe!");
                    return BadRequest(_response);
                }
                UserResponseDTO usuario = await _workContainer.User.RegisterUser(modelo);
                if (usuario == null)
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add("Error al registrar Usuario!");
                    return BadRequest(_response);
                }
                _response.StatusCode = HttpStatusCode.OK;
                _response.IsExitoso = true;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }

        }


        [Permission]
        [HttpPut("UpdateUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        public async Task<IActionResult> UpdateUser([FromBody] UserDTO modelo)
        {
            if (!ModelState.IsValid)
            {
                _response.StatusCode = HttpStatusCode.BadRequest;
                _response.IsExitoso = false;
                _response.ErrorMessages.Add("Error in model");
                return BadRequest(_response);
            }

            try
            {
                UserDTO response = await _workContainer.User.EditUser(modelo);
                if (response == null)
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add("Something was wrong editing the user");
                    return BadRequest(_response);
                }
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = response;
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }
        }


        [Permission]
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        public async Task<IActionResult> DeleteUser(string id)
        {
            try
            {
                bool response = await _workContainer.User.DeleteUser(id);

                if (!response)
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add("Something was wrong deleting the user");
                    return BadRequest(_response);
                }
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = "User deleted";
                return Ok(_response);
            }
            catch (Exception ex)
            {
                _response.StatusCode = HttpStatusCode.InternalServerError;
                _response.IsExitoso = false;
                _response.ErrorMessages = new List<string>() { ex.ToString() };
                return StatusCode(StatusCodes.Status500InternalServerError, _response);
            }

        }

    }
}

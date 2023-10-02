using Microsoft.AspNetCore.Mvc;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;
using SalesSystem.Permission;
using System.Net;

namespace SalesSystem.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(StatusCodes.Status403Forbidden)]
    public class RoleController : ControllerBase
    {
        private readonly IWorkContainer _workContainer;
        private readonly APIResponseDTO _response;

        public RoleController(IWorkContainer workContainer)
        {
            _workContainer = workContainer;
            _response = new();
        }

        [Permission]
        [HttpGet("GetRoles")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetRoles()
        {
            try
            {
                List<RolDTO> roles = await _workContainer.Role.GetRoles();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = roles;
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
        [HttpGet("{idRol}", Name = "GetRolById")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetRolById(string idRol)
        {
            try
            {
                AspNetRole rol = await _workContainer.Role.GetFirstOrDefault(x => x.Id == idRol);

                rol.Permissions = null;
                rol.MenuRols = null;
                rol.Users = null;
                rol.AspNetRoleClaims = null;

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = rol;
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
        [HttpPut("UpdateRole")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdateRole([FromBody] RolDTO modelo)
        {
            try
            {
                string result = await _workContainer.Role.UpdateRole(modelo);

                if (result != "Ok")
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add(result);
                    return BadRequest(_response);
                }
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = result;
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
        [HttpPost("AddRole")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> AddRole([FromBody] RolDTO modelo)
        {
            try
            {
                string result = await _workContainer.Role.AddRole(modelo);

                if (result != "Ok")
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add(result);
                    return BadRequest(_response);
                }
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = result;
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
        [HttpDelete("{idRole}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> DeleteProduct(string idRole)
        {
            try
            {
                string result = await _workContainer.Role.DeleteRole(idRole);

                if (result != "Ok")
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add(result);
                    return BadRequest(_response);
                }
                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = result;
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

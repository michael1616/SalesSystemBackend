using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Permission;
using System.Net;

namespace SalesSystem.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class MenuController : ControllerBase
    {
        private readonly IWorkContainer _workContainer;
        private readonly APIResponseDTO _response;

        public MenuController(IWorkContainer workContainer, IMapper mapper)
        {
            _workContainer = workContainer;
            _response = new();
        }

        [Permission]
        [HttpGet("{idRol}", Name = "GetMenu")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetMenu(string idRol)
        {
            try
            {
                List<MenuDTO> menu = await _workContainer.Menu.GetMenuByRol(idRol);

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = menu;
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

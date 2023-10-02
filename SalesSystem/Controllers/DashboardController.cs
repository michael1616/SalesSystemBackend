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
    public class DashboardController : ControllerBase
    {
        private readonly IWorkContainer _workContainer;
        private readonly APIResponseDTO _response;

        public DashboardController(IWorkContainer workContainer, IMapper mapper)
        {
            _workContainer = workContainer;
            _response = new();
        }

        [Permission]
        [HttpGet("GetDashboardGraphic")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        public async Task<IActionResult> GetDashboardGraphic()
        {
            try
            {
                DashboardTO resume = await _workContainer.Dashboard.ResumeGraphic();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = resume;
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
        [HttpGet("GetDashboardTotals")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        public async Task<IActionResult> GetDashboardTotals()
        {
            try
            {
                DashboardTO resume = await _workContainer.Dashboard.ResumeTotals();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = resume;
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

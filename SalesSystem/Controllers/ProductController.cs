using AutoMapper;
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
    public class ProductController : ControllerBase
    {
        private readonly IWorkContainer _workContainer;
        private readonly APIResponseDTO _response;
        private readonly IMapper _mapper;

        public ProductController(IWorkContainer workContainer, IMapper mapper)
        {
            _workContainer = workContainer;
            _response = new();
            _mapper = mapper;
        }

        [Permission]
        [HttpGet("GetProducts")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetProducts()
        {
            try
            {
                List<ProductDTO> products = await _workContainer.Product.GetProducts();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = products;
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
        [HttpPut("UpdateProduct")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdateProduct([FromBody] ProductDTO modelo)
        {
            try
            {
                ProductDTO response = await _workContainer.Product.EditProduct(modelo);
                await _workContainer.SaveAsync();

                if (response == null)
                {
                    _response.StatusCode = HttpStatusCode.BadRequest;
                    _response.IsExitoso = false;
                    _response.ErrorMessages.Add("Something was wrong editing the product");
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
        [HttpDelete("{id:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            try
            {
                await _workContainer.Product.Remove(id);
                await _workContainer.SaveAsync();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = "Product deleted";
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
        [HttpPost("AddProduct")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> AddProduct([FromBody] ProductDTO modelo)
        {
            try
            {
                Producto product = _mapper.Map<Producto>(modelo);
                product.FechaRegistro = DateTime.Now;

                await _workContainer.Product.Add(product);
                await _workContainer.SaveAsync();

                _response.IsExitoso = true;
                _response.StatusCode = HttpStatusCode.OK;
                _response.Resultado = "Product Added";

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

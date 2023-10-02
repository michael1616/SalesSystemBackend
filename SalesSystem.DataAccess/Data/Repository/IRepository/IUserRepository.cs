using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IUserRepository : IRepository<AspNetUser>
    {
        Task<List<UserDTO>> UsersList();

        Task<LoginResponseDTO> ValidCredentials(LoginRequestDTO credentials);

        Task<UserResponseDTO> RegisterUser(UserDTO userRequestDTO);

        Task<bool> IsUniqueUser(string email);

        Task<UserDTO> EditUser(UserDTO userRequestDTO);

        Task<bool> DeleteUser(string id);

        Task<string> getIdRolByUserId(string id);
    }
}

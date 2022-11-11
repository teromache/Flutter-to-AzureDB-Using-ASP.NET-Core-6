using System.Collections.Generic;
using System.Threading.Tasks;
using fixit.DTO;

namespace fixit.Data
{
    public interface CustomerIRepository<T>
    {
        Task<List<T>> GetData();
        Task<T> GetDataById(int id);

        Task<T> InsertData(T customer);
        Task<T> UpdateData(T customer);
        Task<bool> DeleteData(T customer);

    }
}
namespace Application.Common.Interfaces;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Data;

public interface IExcelReader
{
    DataSet ReadExcelData(string filePath);
    DataSet ReadExcelFromFile(IFormFile file);
    IList<Tentity> ReadExcelDataFromFile<Tentity, TmappingEntity>(IFormFile file);
}

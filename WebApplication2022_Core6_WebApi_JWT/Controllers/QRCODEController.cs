using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
//************************************************************
using WebApplication2022_Core6_WebApi_JWT.QRCoder;

// 請先安裝 NuGet -- 搜尋關鍵字  QRCoder    (作者：Raffael Herrmann)
// 資料與範例來源 https://levelup.gitconnected.com/net-5-generate-qrcode-c11a55356fdf

namespace WebApplication2022_Core6_WebApi_JWT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QRCODEController : ControllerBase
    {

        [HttpGet]
        public IActionResult GetByUrl([FromQuery] string url)
        {
            if (string.IsNullOrEmpty(url))
            {
                url = "https://dotblogs.com.tw/mis2000lab/";   
                // 請輸入您需要轉成 QR Code的URL，字串也可以讓對方（Client端）傳過來
            }
            var image = QrCodeGenerator.GenerateByteArray(url);
            return File(image, "image/jpeg");
        }

    }
}

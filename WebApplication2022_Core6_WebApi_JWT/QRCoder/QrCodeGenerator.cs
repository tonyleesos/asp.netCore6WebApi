using System.Linq;
// **********************************************************
using System.Drawing;    // Bitmap會用到                      (請先安裝 NuGet -- 搜尋關鍵字 System.Drawing)
using System.IO;              // MemoryStream會用到        (請先安裝 NuGet -- 搜尋關鍵字 System.IO)

using QRCoder;                // 目錄名稱
// 請先安裝 NuGet -- 搜尋關鍵字  QRCoder    (作者：Raffael Herrmann)
// 資料與範例來源 https://levelup.gitconnected.com/net-5-generate-qrcode-c11a55356fdf

namespace WebApplication2022_Core6_WebApi_JWT.QRCoder
{
    public static class QrCodeGenerator
    {          // 注意 ***** 關鍵字 static

        public static byte[] GenerateByteArray(string url)
        {           // 注意 ***** 關鍵字 static
            var image = GenerateImage(url);
            return ImageToByte(image);
        }

        /// <summary>
        /// 繪製圖片（QR Code）
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static Bitmap GenerateImage(string url)    // 需要搭配 System.Drawing命名空間
        {          // 注意 ***** 關鍵字 static
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(url, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(10);
            return qrCodeImage;
        }

        private static byte[] ImageToByte(Image img)
        {          // 注意 ***** 關鍵字 static
            using var stream = new MemoryStream();    // 需要搭配 System.IO命名空間
            img.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
            return stream.ToArray();
        }
    }
}

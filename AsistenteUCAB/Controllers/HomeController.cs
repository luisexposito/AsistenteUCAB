using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;


namespace AsistenteUCAB.Controllers
{
    
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "ASP.NET MVC";
            //ReadPdfFile();
            return View();
        }

        public string ReadPdfFile()
        {
            PdfReader reader2 = new PdfReader("c:\\prueba.pdf");
            string strText = string.Empty;

            for (int page = 1; page <= reader2.NumberOfPages; page++)
            {
                ITextExtractionStrategy its = new iTextSharp.text.pdf.parser.SimpleTextExtractionStrategy();
                PdfReader reader = new PdfReader("c:\\prueba.pdf");
                String s = PdfTextExtractor.GetTextFromPage(reader, page, its);

                s = Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(s)));
                strText = strText + s;
                reader.Close();
            }
            return strText;
        }

        public ActionResult About()
        {
            return View();
        }
    }
}

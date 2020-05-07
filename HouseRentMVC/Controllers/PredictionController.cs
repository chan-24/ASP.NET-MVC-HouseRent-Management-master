using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.ML;
using System.Web.Mvc.Html;



namespace Prediction.Controllers
{
    public class PredictionController : Controller
    {
        [HttpGet]
        public ActionResult price()
        {
            if (Session["Login"] == null)
            {

                return RedirectToAction("Index", "Login");


            }
            // Load the model  
            MLContext mlContext = new MLContext();

            // Create predection engine related to the loaded train model  
            ITransformer mlModel = mlContext.Model.Load(@"C:\Users\320090153\source\repos\ASP.NET-MVC-HouseRent-Management-master\HouseRentMVCML.Model\MLModel.zip", out var modelInputSchema);
            var predEngine = mlContext.Model.CreatePredictionEngine<HouseRentMVCML.Model.ModelInput, HouseRentMVCML.Model.ModelOutput>(mlModel);


            return View();
        }
        [HttpPost]
        public ActionResult price(HouseRentMVCML.Model.ModelInput input)
        {
            Session["message"] = "New Area Added";

            // Load the model  
            MLContext mlContext = new MLContext();
            // Create predection engine related to the loaded train model  
            ITransformer mlModel = mlContext.Model.Load(@"C:\Users\320090153\source\repos\ASP.NET-MVC-HouseRent-Management-master\HouseRentMVCML.Model\MLModel.zip", out var modelInputSchema);
            var predEngine = mlContext.Model.CreatePredictionEngine<HouseRentMVCML.Model.ModelInput, HouseRentMVCML.Model.ModelOutput>(mlModel);

            // Try model on sample data to predict fair price  
            HouseRentMVCML.Model.ModelOutput result = predEngine.Predict(input);

            ViewBag.Price = result.Score;
            Console.WriteLine(result.Score);
            return View(input);
        }

    }
}
using Microsoft.AspNetCore.Mvc;
using RegistroFacturasApp1.Models;

namespace RegistroFacturasApp1.Controllers
{
    public class FacturasController : Controller
    {
        // Acción para mostrar el formulario de registro
        public IActionResult Crear()
        {
            return View();
        }

        // Acción para procesar el formulario de registro
        [HttpPost]
        public IActionResult Guardar(Factura factura)
        {
            // Lógica para guardar la factura (aquí simulamos la base de datos)
            // En un proyecto real, aquí se guardaría en una base de datos

            // Redirige a la vista de impresión con los datos de la factura
            return RedirectToAction("Imprimir", factura);
        }

        // Acción para mostrar la vista imprimible
        public IActionResult Imprimir(Factura factura)
        {
            return View(factura);
        }
    }
}
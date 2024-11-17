using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.DTOs
{
	public class Resultado<T>
	{
		public T Value { get; set; }
		public string MensajeError { get; set; } 

		public string MensajeExito { get; set; }
		public bool Exito => string.IsNullOrEmpty(MensajeError);

		public Resultado(T value)
		{
			this.Value = value;
		}

		public Resultado(string mensaError)
		{
			this.MensajeError = mensaError;
		}
	}
}
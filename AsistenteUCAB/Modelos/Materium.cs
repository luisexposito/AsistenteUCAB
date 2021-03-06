using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Materium
	{
        [Required, Range(typeof(int), "1", "6", ErrorMessage = "{0} debe estar entre {1:d} y {2:d}")]
		public virtual int Creditos
		{
			get;
			set;
		}
		public virtual string Descripcion
		{
			get;
			set;
		}
        [DisplayName("Horas de Laboratorio")]
        [Range(typeof(int), "2", "6", ErrorMessage = "{0} debe estar entre {1:d} y {2:d}")]
		public virtual int HorasLab
		{
			get;
			set;
		}
        [DisplayName("Hora de Practica")]
        [Range(typeof(int), "2", "6", ErrorMessage = "{0} debe estar entre {1:d} y {2:d}")]
		public virtual int HorasPractica
		{
			get;
			set;
		}
        [DisplayName("Hora de Teoria")]
        [Range(typeof(int), "2", "6", ErrorMessage = "{0} debe estar entre {1:d} y {2:d}")]
		public virtual int HorasTeoria
		{
			get;
			set;
		}
		public virtual int IdMateria
		{
			get;
			set;
		}
        [Required]
        [DataType(DataType.Text)]
		public virtual string Nombre
		{
			get;
			set;
		}
        [Required, Range(typeof(int), "1", "10", ErrorMessage = "{0} debe estar entre {1:d} y {2:d}")]
        [DisplayName("Periodo Academico")]
		public virtual int Periodo
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Materium);
		}
		
		public virtual bool Equals(Materium obj)
		{
			if (obj == null) return false;

			if (Equals(Creditos, obj.Creditos) == false)
				return false;

			if (Equals(Descripcion, obj.Descripcion) == false)
				return false;

			if (Equals(HorasLab, obj.HorasLab) == false)
				return false;

			if (Equals(HorasPractica, obj.HorasPractica) == false)
				return false;

			if (Equals(HorasTeoria, obj.HorasTeoria) == false)
				return false;

			if (Equals(IdMateria, obj.IdMateria) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			if (Equals(Periodo, obj.Periodo) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Creditos != null ? Creditos.GetHashCode() : 0);
			result = (result * 397) ^ (Descripcion != null ? Descripcion.GetHashCode() : 0);
			result = (result * 397) ^ (HorasLab != null ? HorasLab.GetHashCode() : 0);
			result = (result * 397) ^ (HorasPractica != null ? HorasPractica.GetHashCode() : 0);
			result = (result * 397) ^ (HorasTeoria != null ? HorasTeoria.GetHashCode() : 0);
			result = (result * 397) ^ (IdMateria != null ? IdMateria.GetHashCode() : 0);
			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);
			result = (result * 397) ^ (Periodo != null ? Periodo.GetHashCode() : 0);			
			return result;
		}
	}
}
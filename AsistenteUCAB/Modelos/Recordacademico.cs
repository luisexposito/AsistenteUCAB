using System;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Recordacademico
	{
        [Required]
        [RegularExpression(@"^((\d))$", ErrorMessage = "Ejemplo Expediente: 123456")]
        [DataType(DataType.Text)]
		public virtual int Expediente
		{
			get;
			set;
		}
        [Required]
		public virtual int IdMateria
		{
			get;
			set;
		}
		public virtual int IdRecord
		{
			get;
			set;
		}
        [Required, Range(typeof(int), "0", "20", ErrorMessage = "{0} debe estar entre {1:d} y {2:d}")]
		public virtual int Nota
		{
			get;
			set;
		}
        [Required]
        [DataType(DataType.Text)]
		public virtual string PeriodoAcademico
		{
			get;
			set;
		}
        [Required]
        [RegularExpression(@"S|N")]
        [DataType(DataType.Text)]
		public virtual string Reparacion
		{
			get;
			set;
		}
        public virtual Alumno Alumno
        {
            get;
            set;
        }
        public virtual Materium Materium
        {
            get;
            set;
        }
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Recordacademico);
		}
		
		public virtual bool Equals(Recordacademico obj)
		{
			if (obj == null) return false;

			if (Equals(Expediente, obj.Expediente) == false)
				return false;

			if (Equals(IdMateria, obj.IdMateria) == false)
				return false;

			if (Equals(IdRecord, obj.IdRecord) == false)
				return false;

			if (Equals(Nota, obj.Nota) == false)
				return false;

			if (Equals(PeriodoAcademico, obj.PeriodoAcademico) == false)
				return false;

			if (Equals(Reparacion, obj.Reparacion) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Expediente != null ? Expediente.GetHashCode() : 0);
			result = (result * 397) ^ (IdMateria != null ? IdMateria.GetHashCode() : 0);
			result = (result * 397) ^ (IdRecord != null ? IdRecord.GetHashCode() : 0);
			result = (result * 397) ^ (Nota != null ? Nota.GetHashCode() : 0);
			result = (result * 397) ^ (PeriodoAcademico != null ? PeriodoAcademico.GetHashCode() : 0);
			result = (result * 397) ^ (Reparacion != null ? Reparacion.GetHashCode() : 0);			
			return result;
		}
	}
}
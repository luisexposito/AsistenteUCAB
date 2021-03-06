using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Actividad
	{

        public virtual int IdActividad
        {
            get;
            set;
        }

        [Required]
        [DisplayName("Actividad")]
        public virtual string Nombre
        {
            get;
            set;
        }

        [Required]
        [DisplayName("Fecha y hora fin")]
		public virtual DateTime HoraFin
		{
			get;
			set;
		}
        [Required]
        [DisplayName("Fecha y hora de inicio")]
		public virtual DateTime HoraInicio
		{
			get;
			set;
		}

        [Required]
        public virtual int Expediente
        {
            get;
            set;
        }

        public virtual int? IdMateria
		{
			get;
			set;
		}

        public virtual string Seccion
        {
            get;
            set;
        }

        [DisplayName("Periodo Academico")]
		public virtual string Periodo
		{
			get;
			set;
		}

        [DisplayName("Materia Asociada")]
        public virtual Materium Materia
        {
            get;
            set;
        }

		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Actividad);
		}
		
		public virtual bool Equals(Actividad obj)
		{
			if (obj == null) return false;

			if (Equals(Expediente, obj.Expediente) == false)
				return false;

			if (Equals(HoraFin, obj.HoraFin) == false)
				return false;

			if (Equals(HoraInicio, obj.HoraInicio) == false)
				return false;

			if (Equals(IdActividad, obj.IdActividad) == false)
				return false;

			if (Equals(IdMateria, obj.IdMateria) == false)
				return false;

			if (Equals(Periodo, obj.Periodo) == false)
				return false;

			if (Equals(Seccion, obj.Seccion) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Expediente != null ? Expediente.GetHashCode() : 0);
			result = (result * 397) ^ (HoraFin != null ? HoraFin.GetHashCode() : 0);
			result = (result * 397) ^ (HoraInicio != null ? HoraInicio.GetHashCode() : 0);
			result = (result * 397) ^ (IdActividad != null ? IdActividad.GetHashCode() : 0);
			result = (result * 397) ^ (IdMateria != null ? IdMateria.GetHashCode() : 0);
			result = (result * 397) ^ (Periodo != null ? Periodo.GetHashCode() : 0);
			result = (result * 397) ^ (Seccion != null ? Seccion.GetHashCode() : 0);			
			return result;
		}
	}
}
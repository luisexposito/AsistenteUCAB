using System;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Cronograma
	{
        [Required]
		public virtual int IdActividad
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
        public  virtual Alumno Alumno
        {
            get;
            set;
        }
        public virtual Actividad Actividad
        {
            get;
            set;
        }

		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Cronograma);
		}
		
		public virtual bool Equals(Cronograma obj)
		{
			if (obj == null) return false;

            if (Equals(IdActividad, obj.IdActividad) == false)
				return false;

			if (Equals(Expediente, obj.Expediente) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

            result = (result * 397) ^ (IdActividad != null ? IdActividad.GetHashCode() : 0);
            result = (result * 397) ^ (Expediente != null ? Expediente.GetHashCode() : 0);			
			return result;
		}
	}
}
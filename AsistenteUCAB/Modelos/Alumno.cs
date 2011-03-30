using System;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Alumno
	{
        public virtual int Expediente
        {
            get;
            set;
        }
        public virtual string Nombre
        {
            get;
            set;
        }
		public virtual string Apellido
		{
			get;
			set;
		}
		public virtual string Cedula
		{
			get;
			set;
		}
        public virtual string CorreoUcab
        {
            get;
            set;
        }
		public virtual string CorreoAlternativo
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Alumno);
		}
		
		public virtual bool Equals(Alumno obj)
		{
			if (obj == null) return false;

			if (Equals(Apellido, obj.Apellido) == false)
				return false;

			if (Equals(Cedula, obj.Cedula) == false)
				return false;

			if (Equals(CorreoAlternativo, obj.CorreoAlternativo) == false)
				return false;

			if (Equals(CorreoUcab, obj.CorreoUcab) == false)
				return false;

			if (Equals(Expediente, obj.Expediente) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Apellido != null ? Apellido.GetHashCode() : 0);
			result = (result * 397) ^ (Cedula != null ? Cedula.GetHashCode() : 0);
			result = (result * 397) ^ (CorreoAlternativo != null ? CorreoAlternativo.GetHashCode() : 0);
			result = (result * 397) ^ (CorreoUcab != null ? CorreoUcab.GetHashCode() : 0);
			result = (result * 397) ^ (Expediente != null ? Expediente.GetHashCode() : 0);
			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);			
			return result;
		}
	}
}
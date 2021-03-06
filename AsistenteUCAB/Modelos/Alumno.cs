using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Alumno
	{
        [Required]
        [DataType(DataType.Text)]
        public virtual int Expediente
        {
            get;
            set;
        }

        [DataType(DataType.Text)]
        public virtual string Cedula
        {
            get;
            set;
        }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Nombre de Usuario")]
        public virtual string Username
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

        [Required]
        [DataType(DataType.Text)]
		public virtual string Apellido
		{
			get;
			set;
		}

        [DataType(DataType.Text)]
        public virtual string Sexo
        {
            get;
            set;
        }

        [Required]
        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", ErrorMessage = "Formato e-mail: ejemplo@est.ucab.edu.ve")]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Correo UCAB")]
        public virtual string CorreoUcab
        {
            get;
            set;
        }

        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", ErrorMessage = "Formato e-mail: ejemplo@gmail.com")]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Correo Alternativo")]
		public virtual string CorreoAlternativo
		{
			get;
			set;
		}

        [Required]
        public virtual int IdDireccion
        {
            get;
            set;
        }

        [DataType(DataType.DateTime)]
        [DisplayName("Fecha de Registro")]
        public virtual string CreationDate
        {
            get;
            set;
        }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Contraseña")]
        public virtual string Password
        {
            get;
            set;
        }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Confirmar contraseña")]
        public virtual string ConfirmPassword
        {
            get;
            set;
        }

        [Required]
        public virtual Direccion Direccion
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
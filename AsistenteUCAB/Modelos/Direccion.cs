using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Direccion
	{
        [Required]
		public virtual int IdDireccion
		{
			get;
			set;
		}

        [Required]
        public virtual string Ciudad
        {
            get;
            set;
        }

        [Required]
        public virtual string Municipio
        {
            get;
            set;
        }

        [Required]
        public virtual string Localidad
        {
            get;
            set;
        }

	}
}
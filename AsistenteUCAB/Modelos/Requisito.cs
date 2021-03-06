using System;
using System.ComponentModel.DataAnnotations;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Requisito
	{
        [Required]
		public virtual int IdMateriaHijo
		{
			get;
			set;
		}
        [Required]
		public virtual int IdMateriaPadre
		{
			get;
			set;
		}
        public  virtual Materium MateriaPadre
        {
            get;
            set;
        }
        public virtual Materium MateriaHijo
        {
            get;
            set;
        }

		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Requisito);
		}
		
		public virtual bool Equals(Requisito obj)
		{
			if (obj == null) return false;

			if (Equals(IdMateriaHijo, obj.IdMateriaHijo) == false)
				return false;

			if (Equals(IdMateriaPadre, obj.IdMateriaPadre) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (IdMateriaHijo != null ? IdMateriaHijo.GetHashCode() : 0);
			result = (result * 397) ^ (IdMateriaPadre != null ? IdMateriaPadre.GetHashCode() : 0);			
			return result;
		}
	}
}
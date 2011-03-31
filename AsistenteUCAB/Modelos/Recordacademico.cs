using System;

namespace AsistenteUCAB.Modelos
{
	[Serializable]
	public partial class Recordacademico
	{
		public virtual int Expediente
		{
			get;
			set;
		}
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
		public virtual int Nota
		{
			get;
			set;
		}
		public virtual string PeriodoAcademico
		{
			get;
			set;
		}
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
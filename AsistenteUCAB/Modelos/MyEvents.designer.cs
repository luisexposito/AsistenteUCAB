﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.1
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AsistenteUCAB.Modelos
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="AsistenteUCAB")]
	public partial class MyEventsDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Definiciones de métodos de extensibilidad
    partial void OnCreated();
    partial void InsertACTIVIDAD(ACTIVIDAD instance);
    partial void UpdateACTIVIDAD(ACTIVIDAD instance);
    partial void DeleteACTIVIDAD(ACTIVIDAD instance);
    #endregion
		
		public MyEventsDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["AsistenteUCABConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public MyEventsDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MyEventsDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MyEventsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MyEventsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<ACTIVIDAD> ACTIVIDAD
		{
			get
			{
				return this.GetTable<ACTIVIDAD>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ACTIVIDAD")]
	public partial class ACTIVIDAD : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _idActividad;
		
		private int _idMateria;
		
		private int _expediente;
		
		private System.DateTime _horaInicio;
		
		private System.DateTime _horaFin;
		
		private string _nombre;
		
		private string _seccion;
		
		private string _periodo;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidActividadChanging(int value);
    partial void OnidActividadChanged();
    partial void OnidMateriaChanging(int value);
    partial void OnidMateriaChanged();
    partial void OnexpedienteChanging(int value);
    partial void OnexpedienteChanged();
    partial void OnhoraInicioChanging(System.DateTime value);
    partial void OnhoraInicioChanged();
    partial void OnhoraFinChanging(System.DateTime value);
    partial void OnhoraFinChanged();
    partial void OnnombreChanging(string value);
    partial void OnnombreChanged();
    partial void OnseccionChanging(string value);
    partial void OnseccionChanged();
    partial void OnperiodoChanging(string value);
    partial void OnperiodoChanged();
    #endregion
		
		public ACTIVIDAD()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_idActividad", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int idActividad
		{
			get
			{
				return this._idActividad;
			}
			set
			{
				if ((this._idActividad != value))
				{
					this.OnidActividadChanging(value);
					this.SendPropertyChanging();
					this._idActividad = value;
					this.SendPropertyChanged("idActividad");
					this.OnidActividadChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_idMateria", DbType="Int NOT NULL")]
		public int idMateria
		{
			get
			{
				return this._idMateria;
			}
			set
			{
				if ((this._idMateria != value))
				{
					this.OnidMateriaChanging(value);
					this.SendPropertyChanging();
					this._idMateria = value;
					this.SendPropertyChanged("idMateria");
					this.OnidMateriaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_expediente", DbType="Int NOT NULL")]
		public int expediente
		{
			get
			{
				return this._expediente;
			}
			set
			{
				if ((this._expediente != value))
				{
					this.OnexpedienteChanging(value);
					this.SendPropertyChanging();
					this._expediente = value;
					this.SendPropertyChanged("expediente");
					this.OnexpedienteChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_horaInicio", DbType="DateTime NOT NULL")]
		public System.DateTime horaInicio
		{
			get
			{
				return this._horaInicio;
			}
			set
			{
				if ((this._horaInicio != value))
				{
					this.OnhoraInicioChanging(value);
					this.SendPropertyChanging();
					this._horaInicio = value;
					this.SendPropertyChanged("horaInicio");
					this.OnhoraInicioChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_horaFin", DbType="DateTime NOT NULL")]
		public System.DateTime horaFin
		{
			get
			{
				return this._horaFin;
			}
			set
			{
				if ((this._horaFin != value))
				{
					this.OnhoraFinChanging(value);
					this.SendPropertyChanging();
					this._horaFin = value;
					this.SendPropertyChanged("horaFin");
					this.OnhoraFinChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_nombre", DbType="VarChar(50)")]
		public string nombre
		{
			get
			{
				return this._nombre;
			}
			set
			{
				if ((this._nombre != value))
				{
					this.OnnombreChanging(value);
					this.SendPropertyChanging();
					this._nombre = value;
					this.SendPropertyChanged("nombre");
					this.OnnombreChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_seccion", DbType="VarChar(10)")]
		public string seccion
		{
			get
			{
				return this._seccion;
			}
			set
			{
				if ((this._seccion != value))
				{
					this.OnseccionChanging(value);
					this.SendPropertyChanging();
					this._seccion = value;
					this.SendPropertyChanged("seccion");
					this.OnseccionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_periodo", DbType="VarChar(10)")]
		public string periodo
		{
			get
			{
				return this._periodo;
			}
			set
			{
				if ((this._periodo != value))
				{
					this.OnperiodoChanging(value);
					this.SendPropertyChanging();
					this._periodo = value;
					this.SendPropertyChanged("periodo");
					this.OnperiodoChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591

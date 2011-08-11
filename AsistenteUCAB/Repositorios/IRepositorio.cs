using System;
using System.Collections.Generic;

namespace AsistenteUCAB.Repositorios
{
    public interface IRepositorio<T>
    {
        /// <summary>
        ///  Metodo para guardar en el repositorio
        /// </summary>
        /// <param name="entity"> representa la entidad que maneja el repositorio</param>
        String Save(T entity);

        /// <summary>
        ///  Metodo para modificar el repositorio
        /// </summary>
        /// <param name="entity"> representa la entidad que maneja el repositorio</param>
        String Update(T entity);

        /// <summary>
        ///  Metodo para eleminar del repositorio
        /// </summary>
        /// <param name="entiy"> representa la entidad que maneja el repositorio</param>
        String Delete(T entiy);

        /// <summary>
        ///  Retorna el todos los objetos del repositorio
        /// </summary>
        /// <returns>Retorna una lista con todos los objetos contenidos en el repositorio</returns>
        IList<T> GetAll();

        /// <summary>
        /// Obtiene el objeto del repositorio segun su clave primaria
        /// </summary>
        /// <param name="id">parametro utilizado para la buscqueda</param>
        /// <returns>Retorna el objeto que tenga el id especificado</returns>
        T GetById(int? id);

        /// <summary>
        /// Obtiene el objeto del repositorio segun una clave unica
        /// </summary>
        /// <param name="uniqueAtribute">parametro utilizado para la buscqueda</param>
        /// <returns>Retorna el objeto que tenga el uniqueAtribute especificado</returns>
        T GetByUniqueAtribute(string uniqueAtribute);
    }
}

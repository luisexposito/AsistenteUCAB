using System;
using System.Collections.Generic;
using AsistenteUCAB.Repositorios;
using NHibernate;
using NHibernate.Criterion;
using AsistenteUCAB.Modelos;

namespace AsistenteUCAB.Repositorios
{
    public class AlumnoRepositorio : IRepositorio<Alumno>
    {
        #region IRepositorio<Alumno> Members

        int IRepositorio<Alumno>.Save(Alumno entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.Expediente;
                }
            }
        }

        bool IRepositorio<Alumno>.Update(Alumno entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Update(entity);
                    transaction.Commit();
                }
            }
            return true;
        }

        void IRepositorio<Alumno>.Delete(Alumno entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Delete(entity);
                    transaction.Commit();
                }
            }
        }

        IList<Alumno> IRepositorio<Alumno>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Alumno));

                return criteria.List<Alumno>();
            }
        }

        Alumno IRepositorio<Alumno>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Alumno>().Add(Restrictions.Eq("Expediente", id)).UniqueResult<Alumno>();
        }

        #endregion
    }
}

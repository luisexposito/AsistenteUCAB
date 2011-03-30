using System;
using System.Collections.Generic;
using AsistenteUCAB.Repositorios;
using NHibernate;
using NHibernate.Criterion;
using AsistenteUCAB.Modelos;

namespace AsistenteUCAB.Repositorios
{
    public class ActividadRepositorio : IRepositorio<Actividad>
    {
        #region IRepositorio<Actividad> Members

        int IRepositorio<Actividad>.Save(Actividad entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdActividad;
                }
            }
        }

        bool IRepositorio<Actividad>.Update(Actividad entity)
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

        void IRepositorio<Actividad>.Delete(Actividad entity)
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

        IList<Actividad> IRepositorio<Actividad>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Actividad));
                return criteria.List<Actividad>();
            }
        }

        Actividad IRepositorio<Actividad>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Actividad>().Add(Restrictions.Eq("IdActividad", id)).UniqueResult<Actividad>();
        }

        #endregion
    }
}

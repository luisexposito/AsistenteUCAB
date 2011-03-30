using System;
using System.Collections.Generic;
using AsistenteUCAB.Repositorios;
using NHibernate;
using NHibernate.Criterion;
using AsistenteUCAB.Modelos;

namespace AsistenteUCAB.Repositorios
{
    public class RequisitoRepositorio : IRepositorio<Requisito>
    {
        #region IRepositorio<Requisito> Members

        int IRepositorio<Requisito>.Save(Requisito entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdMateriaPadre;// la PK es Compuesta
                }
            }
        }

        bool IRepositorio<Requisito>.Update(Requisito entity)
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

        void IRepositorio<Requisito>.Delete(Requisito entity)
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

        IList<Requisito> IRepositorio<Requisito>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Requisito));

                return criteria.List<Requisito>();
            }
        }

        Requisito IRepositorio<Requisito>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Requisito>().Add(Restrictions.Eq("IdIdMateriaPadre", id)).UniqueResult<Requisito>();
        }

        #endregion
    }
}

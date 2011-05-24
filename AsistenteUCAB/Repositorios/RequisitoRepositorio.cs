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

        String IRepositorio<Requisito>.Save(Requisito entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Save(entity);
                        transaction.Commit();
                        return "true";
                    }
                    catch (Exception e)
                    {
                        return e.Message;
                    }
                    
                }
            }
        }

        String IRepositorio<Requisito>.Update(Requisito entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Update(entity);
                        transaction.Commit();
                        return "true";
                    }
                    catch (Exception e)
                    {
                        return e.Message;
                    }
                    
                }
            }
        }

        String IRepositorio<Requisito>.Delete(Requisito entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Delete(entity);
                        transaction.Commit();
                        return "true";
                    }
                    catch (Exception e)
                    {
                        return e.Message;
                    }
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

        public Requisito GetByUniqueAtribute(string uniqueAtribute)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}

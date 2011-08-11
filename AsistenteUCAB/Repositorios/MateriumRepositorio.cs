using System;
using System.Collections.Generic;
using AsistenteUCAB.Repositorios;
using NHibernate;
using NHibernate.Criterion;
using AsistenteUCAB.Modelos;

namespace AsistenteUCAB.Repositorios
{
    public class MateriumRepositorio : IRepositorio<Materium>
    {
        #region IRepositorio<Materium> Members

        String IRepositorio<Materium>.Save(Materium entity)
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

        String IRepositorio<Materium>.Update(Materium entity)
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

       String IRepositorio<Materium>.Delete(Materium entity)
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

        IList<Materium> IRepositorio<Materium>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Materium));

                return criteria.List<Materium>();
            }
        }

        Materium IRepositorio<Materium>.GetById(int? id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Materium>().Add(Restrictions.Eq("IdMateria", id)).UniqueResult<Materium>();
        }

        public Materium GetByUniqueAtribute(string uniqueAtribute)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}

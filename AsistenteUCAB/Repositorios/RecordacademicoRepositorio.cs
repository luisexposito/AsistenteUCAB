using System;
using System.Collections.Generic;
using AsistenteUCAB.Repositorios;
using NHibernate;
using NHibernate.Criterion;
using AsistenteUCAB.Modelos;

namespace AsistenteUCAB.Repositorios
{
    public class RecordacademicoRepositorio : IRepositorio<Recordacademico>
    {
        #region IRepositorio<Recordacademico> Members

        String IRepositorio<Recordacademico>.Save(Recordacademico entity)
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

        String IRepositorio<Recordacademico>.Update(Recordacademico entity)
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

        String IRepositorio<Recordacademico>.Delete(Recordacademico entity)
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

        IList<Recordacademico> IRepositorio<Recordacademico>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Recordacademico));

                return criteria.List<Recordacademico>();
            }
        }

        Recordacademico IRepositorio<Recordacademico>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Recordacademico>().Add(Restrictions.Eq("IdRecord", id)).UniqueResult<Recordacademico>();
        }

        #endregion
    }
}

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

        String IRepositorio<Actividad>.Save(Actividad entity)
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

        string IRepositorio<Actividad>.Update(Actividad entity)
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
                    catch(Exception e)
                    {
                        return e.Message;
                    }
                    
                }
            }
        }

        String IRepositorio<Actividad>.Delete(Actividad entity)
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

        public Actividad GetByUniqueAtribute(string uniqueAtribute)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}

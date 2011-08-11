using System;
using System.Collections.Generic;
using AsistenteUCAB.Repositorios;
using NHibernate;
using NHibernate.Criterion;
using AsistenteUCAB.Modelos;

namespace AsistenteUCAB.Repositorios
{
    public class DireccionRepositorio : IRepositorio<Direccion>
    {
        #region IRepositorio<Direccion> Members

        String IRepositorio<Direccion>.Save(Direccion entity)
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
                    }catch(Exception e)
                    {
                        return e.Message;
                    }
                }
            }
        }

        String IRepositorio<Direccion>.Update(Direccion entity)
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

        String IRepositorio<Direccion>.Delete(Direccion entity)
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

        IList<Direccion> IRepositorio<Direccion>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Direccion));

                return criteria.List<Direccion>();
            }
        }

        Direccion IRepositorio<Direccion>.GetById(int? id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Direccion>().Add(Restrictions.Eq("IdDireccion", id)).UniqueResult<Direccion>();
        }

        public Direccion GetByUniqueAtribute(string uniqueAtribute)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}

/*
 * This file is part of Transitime.org
 * 
 * Transitime.org is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License (GPL) as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * Transitime.org is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Transitime.org .  If not, see <http://www.gnu.org/licenses/>.
 */

package org.transitime.ipc.servers;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.transitime.core.dataCache.VehicleDataCache;
import org.transitime.ipc.data.IpcExtVehicle;
import org.transitime.ipc.data.IpcVehicle;
import org.transitime.ipc.interfaces.VehiclesInterface;
import org.transitime.ipc.rmi.AbstractServer;

/**
 * Implements the VehiclesInterface interface on the server side such that a
 * VehiclessClient can make RMI calls in order to obtain vehicle information.
 * The vehicle information is provided using org.transitime.ipc.data.Vehicle
 * objects.
 *
 * @author SkiBu Smith
 *
 */
public class VehiclesServer extends AbstractServer 
	implements VehiclesInterface {

	// Should only be accessed as singleton class
	private static VehiclesServer singleton;
	
	// The VehicleDataCache associated with the singleton.
	private VehicleDataCache vehicleDataCache;

	private static final Logger logger = 
			LoggerFactory.getLogger(VehiclesServer.class);

	/********************** Member Functions **************************/

	/**
	 * Starts up the PredictionsServer so that RMI calls can query for
	 * predictions. This will automatically cause the object to continue to run
	 * and serve requests.
	 * 
	 * @param projectId
	 * @param predictionManager
	 * @return the singleton PredictionsServer object
	 */
	public static VehiclesServer start(
			String projectId, VehicleDataCache vehicleManager) {
		if (singleton == null) {
			singleton = new VehiclesServer(projectId);
			singleton.vehicleDataCache = vehicleManager;
		}
		
		if (!singleton.getProjectId().equals(projectId)) {
			logger.error("Tried calling PredictionsServer.getInstance() for " +
					"projectId={} but the singleton was created for projectId={}", 
					projectId, singleton.getProjectId());
			return null;
		}
		
		return singleton;
	}
	
	/*
	 * Constructor. Made private so that can only be instantiated by
	 * get(). Doesn't actually do anything since all the work is done in
	 * the superclass constructor.
	 * 
	 * @param projectId
	 *            for registering this object with the rmiregistry
	 */
	private VehiclesServer(String projectId) {
		super(projectId, VehiclesInterface.class.getSimpleName());
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#get()
	 */
	@Override
	public Collection<IpcVehicle> get() throws RemoteException {
		return getSerializableCollection(vehicleDataCache.getVehicles());
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#get()
	 */
	@Override
	public Collection<IpcExtVehicle> getExt() throws RemoteException {
		return getExtSerializableCollection(vehicleDataCache.getVehicles());
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#get(java.lang.String)
	 */
	@Override
	public IpcVehicle get(String vehicleId) throws RemoteException {
		return vehicleDataCache.getVehicle(vehicleId);
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#get(java.lang.String)
	 */
	@Override
	public IpcExtVehicle getExt(String vehicleId) throws RemoteException {
		return vehicleDataCache.getVehicle(vehicleId);
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#get(java.util.List)
	 */
	@Override
	public Collection<IpcVehicle> get(List<String> vehicleIds) 
			throws RemoteException {
		return getSerializableCollection(
				vehicleDataCache.getVehicles(vehicleIds));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#get(java.util.List)
	 */
	@Override
	public Collection<IpcExtVehicle> getExt(List<String> vehicleIds) 
			throws RemoteException {
		return getExtSerializableCollection(
				vehicleDataCache.getVehicles(vehicleIds));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRoute(java.lang.String)
	 */
	@Override
	public Collection<IpcVehicle> getForRoute(String routeShortName) throws RemoteException {
		return getSerializableCollection(
				vehicleDataCache.getVehiclesForRoute(routeShortName));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRoute(java.lang.String)
	 */
	@Override
	public Collection<IpcExtVehicle> getExtForRoute(String routeShortName) throws RemoteException {
		return getExtSerializableCollection(
				vehicleDataCache.getVehiclesForRoute(routeShortName));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRoute(java.util.Collection)
	 */
	@Override
	public Collection<IpcVehicle> getForRoute(
		List<String> routeShortNames) throws RemoteException {
	    return getSerializableCollection(
			vehicleDataCache.getVehiclesForRoute(routeShortNames));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRoute(java.util.Collection)
	 */
	@Override
	public Collection<IpcExtVehicle> getExtForRoute(
		List<String> routeShortNames) throws RemoteException {
	    return getExtSerializableCollection(
			vehicleDataCache.getVehiclesForRoute(routeShortNames));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRouteUsingRouteId(java.lang.String)
	 */
	@Override
	public Collection<IpcVehicle> getForRouteUsingRouteId(String routeId)
			throws RemoteException {
		return getSerializableCollection(
				vehicleDataCache.getVehiclesForRouteUsingRouteId(routeId));
	}
	
	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRouteUsingRouteId(java.util.Collection)
	 */
	@Override
	public Collection<IpcVehicle> getForRouteUsingRouteId(
		List<String> routeIds) throws RemoteException {
		return getSerializableCollection(
			vehicleDataCache.getVehiclesForRouteUsingRouteId(routeIds));
	}

	/* (non-Javadoc)
	 * @see org.transitime.ipc.interfaces.VehiclesInterface#getForRouteUsingRouteId(java.util.Collection)
	 */
	@Override
	public Collection<IpcExtVehicle> getExtForRouteUsingRouteId(
		List<String> routeIds) throws RemoteException {
		return getExtSerializableCollection(
			vehicleDataCache.getVehiclesForRouteUsingRouteId(routeIds));
	}

	/*
	 * This class returns Collections of Vehicles that are to be serialized.
	 * But sometimes these collections come from Map<K, T>.values(), which
	 * is a Collection that is not serializable. For such non-serializable
	 * collections this method returns a serializable version.
	 */
	private Collection<IpcVehicle> getSerializableCollection(
			Collection<IpcExtVehicle> vehicles) {
		// If vehicles is null then return empty array
		if (vehicles == null)
			return new ArrayList<IpcVehicle>();
		
		return new ArrayList<IpcVehicle>(vehicles);
	}

	/**
	 * This class returns Collection of Vehicles that are to be serialized. But
	 * sometimes these collections come from Map<K, T>.values(), which is a
	 * Collection that is not serializable. For such non-serializable
	 * collections this method returns a serializable version. If vehicles
	 * parameter is null then an empty array is returned.
	 * 
	 * @param vehicles
	 *            Original, possible not serializable, collection of vehicles.
	 *            Can be null.
	 * @return Serializable Collection if IcExtVehicle.
	 */
	private Collection<IpcExtVehicle> getExtSerializableCollection(
			Collection<IpcExtVehicle> vehicles) {
		// If vehicles is null then return empty array.
		if (vehicles == null)
			return new ArrayList<IpcExtVehicle>();
		
		if (vehicles instanceof Serializable) { 
			return vehicles;
		} else {
			return new ArrayList<IpcExtVehicle>(vehicles);
		}			
	}
	
}

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

package org.transitclock.ipc.clients;

import java.util.HashMap;
import java.util.Map;
import org.transitclock.ipc.interfaces.VehiclesInterface;
import org.transitclock.ipc.rmi.ClientFactory;

/**
 * Provides a VehiclesInterface client that can be queried for Vehicle info.
 *
 * @author SkiBu Smith
 */
public class VehiclesInterfaceFactory {

  // Keyed by agencyId
  private static Map<String, VehiclesInterface> vehiclesInterfaceMap =
      new HashMap<String, VehiclesInterface>();

  /********************** Member Functions **************************/

  /**
   * Gets the singleton instance.
   *
   * @param agencyId
   * @return
   */
  public static VehiclesInterface get(String agencyId) {
    VehiclesInterface vehiclesInterface = vehiclesInterfaceMap.get(agencyId);
    if (vehiclesInterface == null) {
      vehiclesInterface = ClientFactory.getInstance(agencyId, VehiclesInterface.class);
      vehiclesInterfaceMap.put(agencyId, vehiclesInterface);
    }

    return vehiclesInterface;
  }
}

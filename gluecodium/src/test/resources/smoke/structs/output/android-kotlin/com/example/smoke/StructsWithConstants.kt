/*

 *
 */

package com.example.smoke


class StructsWithConstants {

    class Route {
        var description: String
        var type: RouteUtils.RouteType



        constructor(description: String, type: RouteUtils.RouteType) {
            this.description = description
            this.type = type
        }


        companion object {
            val DEFAULT_DESCRIPTION: String = "Nonsense"
            val DEFAULT_TYPE: RouteUtils.RouteType = RouteUtils.RouteType.EQUESTRIAN
        }
    }





}


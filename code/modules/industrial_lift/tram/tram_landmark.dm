GLOBAL_LIST_EMPTY(tram_landmarks)

/obj/effect/landmark/tram
	name = "tram destination" //the tram buttons will mention this.
	icon_state = "tram"

	///the id of the tram we're linked to.
	var/specific_lift_id = MAIN_STATION_TRAM
	/// The ID of that particular destination.
	var/platform_code = null
	/// Icons for the tgui console to list out for what is at this location
	var/list/tgui_icons = list()

/obj/effect/landmark/tram/Initialize(mapload)
	. = ..()
	LAZYADDASSOCLIST(GLOB.tram_landmarks, specific_lift_id, src)

/obj/effect/landmark/tram/Destroy()
	LAZYREMOVEASSOC(GLOB.tram_landmarks, specific_lift_id, src)
	return ..()


/obj/effect/landmark/tram/tramstation/west
	name = "West Wing"
	platform_code = TRAMSTATION_WEST
	tgui_icons = list("Arrivals" = "plane-arrival", "Command" = "bullhorn", "Security" = "gavel")

/obj/effect/landmark/tram/tramstation/central
	name = "Central Wing"
	platform_code = TRAMSTATION_CENTRAL
	tgui_icons = list("Service" = "cocktail", "Medical" = "plus", "Engineering" = "wrench")

/obj/effect/landmark/tram/tramstation/east
	name = "East Wing"
	platform_code = TRAMSTATION_EAST
	tgui_icons = list("Departures" = "plane-departure", "Cargo" = "box", "Science" = "flask")

/**
 * lift_id landmarks. used to map in specific_lift_id to trams. when the trams lift_master encounters one on a trams tile
 * it sets its specific_lift_id to that landmark. allows you to have multiple trams and multiple controls linking to their specific tram
 */
/obj/effect/landmark/lift_id
	name = "lift id setter"
	icon_state = "lift_id"

	///what specific id we give to the tram we're placed on, should explicitely set this if its a subtype, or weird things might happen
	var/specific_lift_id = MAIN_STATION_TRAM


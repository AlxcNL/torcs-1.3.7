/***************************************************************************
 
    file                 : WrapperBaseDriver.cpp
    copyright            : (C) 2007 Daniele Loiacono
 
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
#include "WrapperBaseDriver.h"

void writeCsvRow(CarState X, CarControl Y) {
	/**
     * CSV Representation
    */
    // X : Sensor Features
    printf( "%f;%f;%f;%f;%f%f", X.getAngle(), X.getCurLapTime(), X.getDamage(), X.getDistRaced(), X.getFuel(), X.getGear() );

    // Y : Actions
    printf("%f\n", Y.getAccel());

    // csvRow += cs.getLastLapTime();
    // csvRow += cs.getOpponents(36);
    // csvRow += cs.getRacePos();
    // csvRow += cs.getRpm();
    // csvRow += cs.getSpeedX();
    // csvRow += cs.getSpeedY();
    // csvRow += cs.getSpeedZ();
    // csvRow += cs.getTrack(19);
	// csvRow += cs.getTrackPos();
	// csvRow += cs.getWheelSpinVel(4);
	// csvRow += cs.getZ();
	// csvRow += cs.getFocus(5);
    // csvRow += cs.getDistFromStart();

    // printf("%s\n", csvRow);

}

string 
WrapperBaseDriver::drive(string sensors)
{
	CarState cs(sensors);
	CarControl cc = wDrive(cs);
    writeCsvRow(cs, cc);
	return cc.toString();	
}


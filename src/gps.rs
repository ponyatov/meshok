//! basic GPS location

#![allow(non_snake_case)]
#![allow(non_upper_case_globals)]
#![allow(dead_code)]

/// horizontal coordinate
type HCoord = i32;
/// 4 decimal places: ~11 meters
const HScale: HCoord = 1_0000;

/// altitude coordinate
type ACoord = i16;
/// 0 decimal places: ~1m
const AScale: ACoord = 1;

/// velocity vector
type VCoord = i8;
const VScale: VCoord = 1;

/// latitude
pub type Lat = HCoord;
/// longitude
pub type Lon = HCoord;
/// altitude
pub type Alt = ACoord;
/// velocity
pub type Vel = VCoord;

/// velocity vector
#[derive(Debug)]
pub struct Velocity {
    /// latitudinal
    pub east: Vel,
    /// longitudinal
    pub north: Vel,
    /// altitudinal
    pub up: Vel,
}

/// location point
#[derive(Debug)]
pub struct Point {
    pub lat: Lat,      // microdegrees
    pub lon: Lon,      // microdegrees
    pub alt: Alt,      // meters
    pub vel: Velocity, // km/h
}

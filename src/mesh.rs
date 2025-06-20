//! mesh network design

#![allow(dead_code)]

use std::time::Instant;

/// data transfer medium
#[derive(Debug)]
pub enum Medium {
    /// local inter-process communication (debug on a single host)
    Icp,
    /// IoT backed nets
    Mqtt,
    /// UDP packets over generic IP networks
    Udp,
    /// raw Ethernet packets
    Eth,
    /// raw WiFi packets
    WiFi,
    /// Bluetooth
    Ble,
    /// LoRaWAN modules
    LoRa,
    /// generic radio trasmitter (freq in Hz)
    Radio(u32),
}

/// interface id (single byte for local/private nets)
type IFaceID = u8;
/// mesh node id (single byte for local/private nets)
#[derive(Debug)]
#[repr(u8)]
pub enum NodeID {
    Broadcast = 0xFF,
    Localhost = 0x00,
    Single(u8),
}

/// network interface
#[derive(Debug)]
pub struct Iface<'a> {
    id: IFaceID,
    name: &'a str,
    /// transmitter (send only)
    tx: Option<Medium>,
    /// optional receiver (optional bidirection)
    rx: Option<Medium>,
}

/// mesh node
#[derive(Debug)]
pub struct Node {
    pub id: NodeID,
    pub last_seen: Instant,
    pub neighbors: Vec<NodeID>,
}

#[derive(Debug)]
pub struct Packet {
    src: NodeID,
    dst: NodeID,
}

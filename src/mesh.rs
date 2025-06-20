//! mesh network design

#![allow(dead_code)]

use std::time::Instant;

/// data transfer medium
#[derive(Debug)]
pub enum Medium {
    /// local inter-process communication (debug on a single host)
    IPC,
    /// IoT backed nets
    MQTT,
    /// UDP packets over generic IP networks
    UDP,
    /// raw Ethernet packets
    Eth,
    /// raw WiFi packets
    WiFi,
    /// Bluetooth
    BLE,
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
    BroadCast = 0xFF,
    LocalHost = 0x00,
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

/// time to live (number of mid hops)
type TTL = u8;

#[derive(Debug)]
pub struct Packet {
    src: NodeID,
    dst: NodeID,
    ttl: TTL,
}

//! mesh network design

#![allow(dead_code)]

use std::time::Instant;

/// data transfer medium
#[derive(Debug)]
pub enum Medium {
    /// UDP packets over generic IP networks
    Udp,
    /// raw Ethernet packets
    Eth,
    /// raw WiFi packets
    WiFi,
    /// LoRaWAN modules
    LoRa,
    /// generic radio trasmitter (freq in Hz)
    Radio(u32),
}

/// mesh node
#[derive(Debug)]
pub struct Node {
    pub id: u8,
    /// last time
    pub last_seen: Instant,
}

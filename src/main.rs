// \ mod
mod test;
// / mod

// \ extern
extern crate tracing;
// / extern

// \ use
use tracing::{info, instrument};
// / use

#[instrument]
fn main() {
    tracing_subscriber::fmt().compact().init();
    let argv: Vec<String> = std::env::args().collect();
    let argc = argv.len();
    info!("start #{:?} {:?}", argc, argv);
    info!("stop");
}

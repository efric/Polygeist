use egg::*;

#[cxx::bridge(namespace = "polyegg")]
mod bridge { 
    extern "Rust" {
        fn friedeggs() -> String;
    }
}

pub fn friedeggs() -> String {
    let my_expression: RecExpr<SymbolLang> = "(foo a b)".parse().unwrap();
    format!("Hello from Rust! :D\nthis is my expression {}", my_expression)
}
FROM rust:1.72.1-slim-bookworm as builder

WORKDIR /usr/src/faq-dmi-bot
COPY . .

RUN cargo build --release

FROM debian:bookworm-slim
COPY --from=builder /usr/src/faq-dmi-bot/target/release/faq-dmi-bot /usr/local/bin/faq-dmi-bot

ENTRYPOINT [ "faq-dmi-bot" ]

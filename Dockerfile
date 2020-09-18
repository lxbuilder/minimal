FROM alpine:3.12 AS assembler

COPY true.asm /

RUN apk add --no-cache nasm && \
	nasm /true.asm && \
	chmod +x /true

FROM scratch
COPY --from=assembler /true /true
CMD ["/true"]

FROM ubuntu

HEALTHCHECK --timeout=2s --retries=1 CMD ls mydir || exit 9

CMD ["top", "-b"]
#
# Targets (see each target for more information):
#   verify: Run verify.
#   import: Run the import script.
#

# Run core verification.
#
# Example:
#   make verify
verify:
	hack/verify-python.sh
	hack/verify-pullrequest.sh
.PHONY: verify

# Run the import script.
#
# Example:
#   make import
import:
	python import_content.py
.PHONY: import

package congress

import (
	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/stretchr/testify/require"
	"strings"
	"testing"
)

func TestJsonUnmarshalABI(t *testing.T) {
	for _, abiStr := range []string{validatorsInteractiveABI, punishInteractiveABI, proposalInteractiveABI} {
		_, err := abi.JSON(strings.NewReader(validatorsInteractiveABI))
		require.NoError(t, err, abiStr)
	}
}

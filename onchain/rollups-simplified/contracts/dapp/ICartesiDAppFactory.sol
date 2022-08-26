// Copyright 2022 Cartesi Pte. Ltd.

// SPDX-License-Identifier: Apache-2.0
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use
// this file except in compliance with the License. You may obtain a copy of the
// License at http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// @title Cartesi DApp Factory interface
pragma solidity ^0.8.13;

import {ICartesiDApp} from "./ICartesiDApp.sol";
import {IConsensus} from "../consensus/IConsensus.sol";

interface ICartesiDAppFactory {
    // Events

    /// @notice Event emitted when a new application is deployed
    /// @param consensus consensus contract
    /// @param dappOwner dapp owner address
    /// @param templateHash state hash of the cartesi machine at t0
    /// @param application application contract
    event ApplicationCreated(
        IConsensus indexed consensus,
        address dappOwner,
        bytes32 templateHash,
        ICartesiDApp application
    );

    // Permissionless functions

    /// @notice Deploy a new application
    /// @param _consensus consensus contract
    /// @param _dappOwner dapp owner address
    /// @param _templateHash state hash of the cartesi machine at t0
    /// @return new application contract
    function newApplication(
        IConsensus _consensus,
        address _dappOwner,
        bytes32 _templateHash
    ) external returns (ICartesiDApp);
}

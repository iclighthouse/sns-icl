# ICLighthouse DAO Governance Method List

## ICDexRouter Canister Method

| Proposal Id | Nervous System Function  id | Description                                                  | Method Name            |
| ----------- | --------------------------- | ------------------------------------------------------------ | ---------------------- |
| 4           | 1000                        | Configure the system parameters of the ICDexRouter.          | sys_config             |
| 5           | 1001                        | Set the wasm of the ICDexPair.                               | setICDexPairWasm       |
| 6           | 1002                        | Set the wasm of the ICDexMaker.                              | setICDexMakerWasm      |
| 7           | 1003                        | Modifying the controllers of the trading pair.               | setControllers         |
| 8           | 1004                        | Modify the controllers of an ICDexMaker canister.            | maker_setControllers   |
| 10          | 1005                        | Create a new trading pair by governance.                     | create                 |
| 11          | 1006                        | Create a new Automated Market Maker (ICDexMaker).            | maker_create           |
| 12          | 1007                        | Set up vip-maker qualification and configure rebate rate.    | pair_setVipMaker       |
| 13          | 1008                        | Suspend (true) or open (false) a trading pair. If `_openingTime` is specified, it means that the pair will be opened automatically after that time. | pair_pause             |
| 14          | 1009                        | Suspend (true) or open (false) all trading pairs.            | pair_pauseAll          |
| 15          | 1010                        | Upgrade all ICDexPairs to latest version.                    | updateAll              |
| 16          | 1011                        | Pause or enable Automated Market Maker (ICDexMaker).         | maker_setPause         |
| 17          | 1012                        | Upgrade all ICDexMakers to the latest version.               | maker_updateAll        |
| 28          | 1016                        | Backs up and saves a snapshot of a trading pair.             | backup                 |
| 29          | 1017                        | Backup the data of a trading pair to another canister.       | backupToTempCanister   |
| 30          | 1018                        | This is a feature to be opened in the future. Register a trading competition with a third party for display. | dex_addCompetition     |
| 31          | 1019                        | Let ICDexMaker approve the `_amount` of the sysToken the trading pair could spend. | maker_approveToPair    |
| 32          | 1020                        | Lock or unlock an Automated Market Maker (ICDexMaker) system transaction lock. | maker_transactionLock  |
| 40          | 1021                        | Upgrade a trading  pair canister.                            | update                 |
| 41          | 1022                        | Reinstall a trading pair canister which  is paused.          | reinstall              |
| 42          | 1023                        | Removes all snapshots prior to the  specified timestamp of the trading pair. | removeSnapshot         |
| 43          | 1024                        | Recover data for a trading pair.      Note: You need to check the wasm version and the status of the trading  pair, the operation may lead to data loss. | recovery               |
| 44          | 1025                        | Save the data of snapshot to another  canister.      Note: Canister `_pairTo` is created only for backing up data and should not  be used for trading. It needs to implement the recover() method like  ICDexPair. | snapshotToTempCanister |
| 45          | 1026                        | Puts a pair into a list of trading pairs.                    | put                    |
| 46          | 1027                        | Removes a pair from  the list of trading pairs.              | remove                 |
| 47          | 1028                        | Enable/disable Auction Mode                                  | pair_setAuctionMode    |
| 48          | 1029                        | Open IDO of a trading pair and configure  parameters         | pair_IDOSetFunder      |
| 49          | 1030                        | Configure the trading pair parameters and  configure its DRC205 parameters. | pair_config            |
| 50          | 1031                        | When the data is too large to be backed  up, you can set the UpgradeMode to #Base. | pair_setUpgradeMode    |
| 51          | 1032                        | Sets an order with  #Todo status as an error order.          | pair_setOrderFail      |
| 52          | 1033                        | Enable strategy orders for a trading  pair.                  | pair_enableStratOrder  |
| 53          | 1034                        | Configuring strategy order parameters for  a trading pair.   | sto_config             |
| 54          | 1035                        | Query all orders in pending status.                          | pair_pendingAll        |
| 55          | 1036                        | Withdraw cycles.                                             | pair_withdrawCycles    |
| 56          | 1037                        | Add/Remove ICTC Administrator                                | pair_ictcSetAdmin      |
| 57          | 1038                        | Clear logs of transaction orders and  transaction tasks.     | pair_ictcClearLog      |
| 58          | 1039                        | Try the task again.                                          | pair_ictcRedoTT        |
| 59          | 1040                        | Complete a blocking order.                                   | pair_ictcCompleteTO    |

## Trader Canister Method

| Proposal Id | NervousSystemFunction  id | Description                                                  | Method Name  |
| ----------- | ------------------------- | ------------------------------------------------------------ | ------------ |
| 23          | 1014                      | Withdrawing funds from Trader to SNS Treasury.               | withdraw     |
| 61          | 1041                      | Add a whitelist  trading pair (only these pairs are allowed to be traded). | setWhitelist |

## Asset Canister Method

| Proposal Id | NervousSystemFunction  id | Description                                             | Method Name           |
| ----------- | ------------------------- | ------------------------------------------------------- | --------------------- |
| 22          | 1013                      | Add frontend governance method `commit_proposed_batch`. | commit_proposed_batch |
| 70          | 1042                      | Add asset canister permission                           | grant_permission      |
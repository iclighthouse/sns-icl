# ICLighthouse DAO Governance Methods List

## ICDexRouter Canister Methods

**Canister ID: i5jcx-ziaaa-aaaar-qaazq-cai**

| Proposal Id | Nervous System Function  id | Description                                                  | Methods Name            |
| ----------- | --------------------------- | ------------------------------------------------------------ | ----------------------- |
| 4           | 1000                        | Configure the system parameters of the ICDexRouter.          | sys_config              |
| 5           | 1001                        | Set the wasm of the ICDexPair.                               | setICDexPairWasm        |
| 6           | 1002                        | Set the wasm of the ICDexMaker.                              | setICDexMakerWasm       |
| 7           | 1003                        | Modifying the controllers of the trading pair.               | setControllers          |
| 8           | 1004                        | Modify the controllers of an ICDexMaker canister.            | maker_setControllers    |
| 10          | 1005                        | Create a new trading pair by governance.                     | create                  |
| 11          | 1006                        | Create a new Automated Market Maker (ICDexMaker).            | maker_create            |
| 12          | 1007                        | Set up vip-maker qualification and configure rebate rate.    | pair_setVipMaker        |
| 13          | 1008                        | Suspend (true) or open (false) a trading pair. If `_openingTime` is specified, it means that the pair will be opened automatically after that time. | pair_pause              |
| 14          | 1009                        | Suspend (true) or open (false) all trading pairs.            | pair_pauseAll           |
| 15          | 1010                        | Upgrade all ICDexPairs to latest version.                    | updateAll               |
| 16          | 1011                        | Pause or enable Automated Market Maker (ICDexMaker).         | maker_setPause          |
| 17          | 1012                        | Upgrade all ICDexMakers to the latest version.               | maker_updateAll         |
| 28          | 1016                        | Backs up and saves a snapshot of a trading pair.             | backup                  |
| 29          | 1017                        | Backup the data of a trading pair to another canister.       | backupToTempCanister    |
| 30          | 1018                        | This is a feature to be opened in the future. Register a trading competition with a third party for display. | dex_addCompetition      |
| 31          | 1019                        | Let ICDexMaker approve the `_amount` of the sysToken the trading pair could spend. | maker_approveToPair     |
| 32          | 1020                        | Lock or unlock an Automated Market Maker (ICDexMaker) system transaction lock. | maker_transactionLock   |
| 40          | 1021                        | Upgrade a trading  pair canister.                            | update                  |
| 41          | 1022                        | Reinstall a trading pair canister which  is paused.          | reinstall               |
| 42          | 1023                        | Removes all snapshots prior to the  specified timestamp of the trading pair. | removeSnapshot          |
| 43          | 1024                        | Recover data for a trading pair.      Note: You need to check the wasm version and the status of the trading  pair, the operation may lead to data loss. | recovery                |
| 44          | 1025                        | Save the data of snapshot to another  canister.      Note: Canister `_pairTo` is created only for backing up data and should not  be used for trading. It needs to implement the recover() method like  ICDexPair. | snapshotToTempCanister  |
| 45          | 1026                        | Puts a pair into a list of trading pairs.                    | put                     |
| 46          | 1027                        | Removes a pair from  the list of trading pairs.              | remove                  |
| 47          | 1028                        | Enable/disable Auction Mode                                  | pair_setAuctionMode     |
| 48          | 1029                        | Open IDO of a trading pair and configure  parameters         | pair_IDOSetFunder       |
| 49          | 1030                        | Configure the trading pair parameters and  configure its DRC205 parameters. | pair_config             |
| 50          | 1031                        | When the data is too large to be backed  up, you can set the UpgradeMode to #Base. | pair_setUpgradeMode     |
| 51          | 1032                        | Sets an order with  #Todo status as an error order.          | pair_setOrderFail       |
| 52          | 1033                        | Enable strategy orders for a trading  pair.                  | pair_enableStratOrder   |
| 53          | 1034                        | Configuring strategy order parameters for  a trading pair.   | sto_config              |
| 54          | 1035                        | Query all orders in pending status.                          | pair_pendingAll         |
| 55          | 1036                        | Withdraw cycles.                                             | pair_withdrawCycles     |
| 56          | 1037                        | Add/Remove ICTC Administrator                                | pair_ictcSetAdmin       |
| 57          | 1038                        | Clear logs of transaction orders and  transaction tasks.     | pair_ictcClearLog       |
| 58          | 1039                        | Try the task again.                                          | pair_ictcRedoTT         |
| 59          | 1040                        | Complete a blocking order.                                   | pair_ictcCompleteTO     |
| 61          | 1041                        | Add a whitelist  trading pair (only these pairs are allowed to be traded) | setWhitelist            |
| 70          | 1042                        | Add asset canister permission                                | grant_permission        |
| 72          | 1043                        | Set status of a pending task.                                | pair_ictcDoneTT         |
| 73          | 1044                        | Set status of a pending order.                               | pair_ictcDoneTO         |
| 74          | 1045                        | Run the ICTC actuator and check the  status of the transaction order `toid`. | pair_ictcRunTO          |
| 75          | 1046                        | Change the status of a transaction order  to #Blocking.      | pair_ictcBlockTO        |
| 76          | 1047                        | Synchronizing token0 and token1 transfer  fees.              | pair_sync               |
| 77          | 1048                        | Removes vip-maker qualification.                             | pair_removeVipMaker     |
| 78          | 1049                        | Retrieve missing funds from the order's  TxAccount. The funds of the TxAccount will be refunded to the ICDexRouter  canister-id. | pair_fallbackByTxid     |
| 79          | 1050                        | Cancels an order.                                            | pair_cancelByTxid       |
| 80          | 1051                        | Submit a text description of the Trading  Ambassadors (referral) system. | pair_taSetDescription   |
| 81          | 1052                        | Withdraw the token to the specified  account.Withdrawals can only be made to a DAO address, or to a blackhole  address (destruction), not to a private address. | sys_withdraw            |
| 82          | 1053                        | Placing an order in  a trading pair as a trader.             | sys_order               |
| 90          | 1054                        | Cancel own orders  as a trader.                              | sys_cancelOrder         |
| 91          | 1055                        | Reinstall an ICDexMaker canister which is  paused.Note: Operate with caution. Consider calling this method only if  upgrading is not possible. | maker_reinstall         |
| 92          | 1056                        | Upgrade an ICDexMaker  canister.Permissions: Dao, Private Maker Creator | maker_update            |
| 93          | 1057                        | Remove an Automated Market Maker  (ICDexMaker).Permissions: Dao, Private Maker Creator | maker_remove            |
| 94          | 1058                        | Configure an Automated Market Maker  (ICDexMaker).           | maker_config            |
| 95          | 1059                        | Reset Automated Market Maker (ICDexMaker)  local account balance. | maker_resetLocalBalance |
| 96          | 1060                        | Withdraw funds from the trading pair to  an Automated Market Maker (ICDexMaker) local account. | maker_dexWithdraw       |
| 97          | 1061                        | Deposit from Automated Market Maker  (ICDexMaker) to TraderAccount for the trading pair. | maker_dexDeposit        |
| 98          | 1062                        | Deletes grid order from Automated Market  Maker (ICDexMaker). | maker_deleteGridOrder   |
| 99          | 1063                        | Creates a grid order for Automated Market  Maker (ICDexMaker) on the trading pair. | maker_createGridOrder   |
| 111         | 1064                        | Batch conversion of  fees in ICDexRouter.                    | sys_conversionFees      |
| 112         | 1065                        | Calls specified  canister's methods, such as trading pairs, using ICDexRouter as a proxy for  governance purposes. This is a generic ICDex governance method with the  disadvantage that the parameters are in binary unreadable form. Proposals that call this method, where its  parameters are not clear, please vote to reject. | sys_call                |
| 120         | 1066                        | Add frontend  governance method commit_proposed_batch        | commit_proposed_batch   |
| 131         | 1067                        | Cancels trade orders in pending on the  trading pair placed by Automated Market Maker (ICDexMaker). | maker_cancelAllOrders   |
| 132         | 1068                        | Put a canister-id into Cycles Monitor.                       | monitor_put             |
| 133         | 1069                        | Remove a canister-id from Cycles Monitor.                    | monitor_remove          |
| 134         | 1070                        | Returns a canister's caniter_status  information.            | debug_canister_status   |
| 135         | 1071                        | Start the Timer, it will be started  automatically when upgrading the canister. | timerStart              |
| 140         | 1072                        | Synchronize trading fees for all pairs.                      | sync                    |
| 141         | 1073                        | Perform a monitoring. Typically,  monitoring is implemented in a timer. | debug_monitor           |
| 142         | 1074                        | Stop the Timer                                               | timerStop               |
| 153         | 1075                        | Add governance  method `ICDexRouter.syncVipMakers()`         | syncVipMakers           |

## DexAggregator Canister Methods

**Canister ID: i2ied-uqaaa-aaaar-qaaza-cai**

| Proposal Id | NervousSystemFunction  id | Description                                             | Methods Name                 |
| ----------- | ------------------------- | ------------------------------------------------------- | ---------------------------- |
| 257         | 1078                      | Add governance  method `DexAggr.syncAllTokenFee()`      | DexAggr.syncAllTokenFee      |
| 258         | 1079                      | Add governance  method `DexAggr.putTradingPair()`       | DexAggr.putTradingPair       |
| 259         | 1080                      | Add governance  method `DexAggr.removeTradingPair()`    | DexAggr.removeTradingPair    |
| 260         | 1081                      | Add governance method  `DexAggr.setScore()`             | DexAggr.setScore             |
| 261         | 1082                      | Add governance method  `DexAggr.putCurrencyToken()`     | DexAggr.putCurrencyToken     |
| 262         | 1083                      | Add governance method  `DexAggr.removeCurrencyToken()`  | DexAggr.putCurrencyToken     |
| 263         | 1084                      | Add governance method `DexAggr.setDex()`                | DexAggr.setDex               |
| 264         | 1085                      | Add governance method `DexAggr.delDex()`                | DexAggr.delDex               |
| 265         | 1086                      | Add governance method  `DexAggr.putPairToMarket()`      | DexAggr.putPairToMarket      |
| 266         | 1087                      | Add governance method  `DexAggr.removePairFromMarket()` | DexAggr.removePairFromMarket |
| 267         | 1088                      | Add governance method  `DexAggr.addTokenMetadata()`     | DexAggr.addTokenMetadata     |
| 268         | 1089                      | Add governance method  `DexAggr.removeTokenMetadata()`  | DexAggr.removeTokenMetadata  |
| 269         | 1090                      | Add governance method `DexAggr.config()`                | DexAggr.config               |
| 270         | 1091                      | Add governance method  `DexAggr.sysWithdraw()`          | DexAggr.sysWithdraw          |
| 271         | 1092                      | Add governance method `DexAggr.sysBurn()`               | DexAggr.sysBurn              |
| 274         | 1093                      | Add governance method  `DexAggr.verifyListingReferre()` | DexAggr.verifyListingReferre |
| 275         | 1094                      | Add governance method  `DexAggr.dropListingReferrer()`  | DexAggr.dropListingReferrer  |
| 276         | 1095                      | Add governance method `DexAggr.propose:  propose()`     | DexAggr.propose:  propose    |
| 277         | 1096                      | Add governance method  `DexAggr.mngNFTUnStake()`        | DexAggr.mngNFTUnStake        |

## Trader Canister Methods

- Liquidity Trader Canister Methods

  **Canister ID: 3yss5-5qaaa-aaaar-qad7a-cai**

  | Proposal Id | NervousSystemFunction  id | Description                                    | Methods Name |
  | ----------- | ------------------------- | ---------------------------------------------- | ------------ |
  | 23          | 1014                      | Withdrawing funds from Trader to SNS Treasury. | withdraw     |

- Conversion Trader Canister Methods

  **Canister ID: 3jd4g-jyaaa-aaaar-qaeba-cai**
  
  | Proposal Id | NervousSystemFunction  id | Description                                                  | Methods Name |
  | ----------- | ------------------------- | ------------------------------------------------------------ | ------------ |
  | 61          | 1041                      | Add a whitelist  trading pair (only these pairs are allowed to be traded). | setWhitelist |

## ICLMining Canister Methods

**Canister ID: odhfn-cqaaa-aaaar-qaana-cai**

| Proposal Id | NervousSystemFunction  id | Description                                                  | Methods Name    |
| ----------- | ------------------------- | ------------------------------------------------------------ | --------------- |
| 169         | 1076                      | Add governance method  `ICLMining.newRound()`Add asset canister permission | Mining.newRound |

## Asset Canister Methods

**Canister ID: 7vkf4-jqaaa-aaaaj-azrua-cai**

| Proposal Id | NervousSystemFunction  id | Description                                             | Methods Name          |
| ----------- | ------------------------- | ------------------------------------------------------- | --------------------- |
| 120         | 1066                      | Add frontend governance method `commit_proposed_batch`. | commit_proposed_batch |
| 70          | 1042                      | Add asset canister permission                           | grant_permission      |
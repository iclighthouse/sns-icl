import Blob "mo:base/Blob";
import Time "mo:base/Time";
import Principal "mo:base/Principal";
import Bool "mo:base/Bool";
import Text "mo:base/Text";
import ICDexRouter "mo:icl/ICDexRouter";
import ICDexTypes "mo:icl/ICDexTypes";
import ICDexPrivate "./lib/ICDexPrivate";
import DRC205 "mo:icl/DRC205";
import SagaTM "./ICTC/SagaTM";
import Maker "mo:icl/ICDexMaker";
import ICRC1 "mo:icl/ICRC1";

shared (msg) actor class ICDexValidator() {

	type Timestamp = ICDexTypes.Timestamp;
	type DexConfig = ICDexTypes.DexConfig;
	type Address = ICDexTypes.Address;
	type Txid = ICDexTypes.Txid;
	type TokenStd = ICDexTypes.TokenStd;
	type OrderPrice = ICDexTypes.OrderPrice;
	type AccountId = ICDexTypes.AccountId;
	type ValidatorResult = {
		#Ok : Text;
		#Err : Text;
	};

	private stable var owner = msg.caller;

	private func onlyOwner(caller : Principal) : Bool {
		if (caller == owner) {
			return true;
		};
		return false;
	};

	public shared (msg) func modifyOwner(o : Principal) {
		assert (onlyOwner(msg.caller));
		owner := o;
	};

	public query func getOwner() : async Principal {
		owner;
	};

	/// ICDexRouter Validator

	public query func validatorSetICDexPairWasm(
		_wasm : Blob,
		_version : Text,
		_multiChunk : ?{ #first; #middle; #final },
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_wasm : Blob,
				_version : Text,
				_multiChunk : ?{ #first; #middle; #final },
			)
		);
	};

	public query func validatorSetICDexMakerWasm(
		_wasm : Blob,
		_version : Text,
		_multiChunk : ?{ #first; #middle; #final },
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_wasm : Blob,
				_version : Text,
				_multiChunk : ?{ #first; #middle; #final },
			)
		);
	};

	public query func validatorCreate(
		_token0 : Principal,
		_token1 : Principal,
		_openingTimeNS : Time.Time,
		_unitSize : ?Nat64,
		_initCycles : ?Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_token0 : Principal,
				_token1 : Principal,
				_openingTimeNS : Time.Time,
				_unitSize : ?Nat64,
				_initCycles : ?Nat,
			)
		);
	};

	public query func validatorUpdate(_pair : Principal, _version : Text) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _version : Text));
	};

	public query func validatorUpdateAll(_version : Text) : async ValidatorResult {
		#Ok(debug_show (_version : Text));
	};

	public query func validatorSetControllers(_pair : Principal, _controllers : [Principal]) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _controllers : [Principal]));
	};

	public query func validatorReinstall(_pair : Principal, _version : Text, _snapshot : Bool) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _version : Text, _snapshot : Bool));
	};

	public query func validatorRemoveSnapshot(_pair : Principal, _timeBefore : Timestamp) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _timeBefore : Timestamp));
	};

	public query func validatorBackup(_pair : Principal) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal));
	};

	public query func validatorRecovery(_pair : Principal, _snapshotTimestamp : Timestamp) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _snapshotTimestamp : Timestamp));
	};

	public query func validatorBackupToTempCanister(_pairFrom : Principal, _pairTo : Principal) : async ValidatorResult {
		#Ok(debug_show (_pairFrom : Principal, _pairTo : Principal));
	};

	public query func validatorSnapshotToTempCanister(
		_pair : Principal,
		_snapshotTimestamp : Timestamp,
		_pairTo : Principal,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_pair : Principal,
				_snapshotTimestamp : Timestamp,
				_pairTo : Principal,
			)
		);
	};

	public query func validatorPut(_pair : ICDexRouter.SwapPair) : async ValidatorResult {
		#Ok(debug_show (_pair : ICDexRouter.SwapPair));
	};

	public query func validatorRemove(_pairCanister : Principal) : async ValidatorResult {
		#Ok(debug_show (_pairCanister : Principal));
	};

	public query func validatorPairPause(_app : Principal, _pause : Bool, _openingTime : ?Time.Time) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _pause : Bool, _openingTime : ?Time.Time));
	};

	public query func validatorPairPauseAll(_pause : Bool) : async ValidatorResult {
		#Ok(debug_show (_pause : Bool));
	};

	public query func validatorPairSetAuctionMode(
		_app : Principal,
		_enable : Bool,
		_funder : ?ICDexRouter.AccountId,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_enable : Bool,
				_funder : ?ICDexRouter.AccountId,
			)
		);
	};

	public query func validatorPairIDOSetFunder(
		_app : Principal,
		_funder : ?Principal,
		_requirement : ?ICDexPrivate.IDORequirement,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_funder : ?Principal,
				_requirement : ?ICDexPrivate.IDORequirement,
			)
		);
	};

	public query func validatorPairConfig(_app : Principal, _config : ?DexConfig, _drc205config : ?DRC205.Config) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _config : ?DexConfig, _drc205config : ?DRC205.Config));
	};

	public query func validatorPairSetUpgradeMode(_app : Principal, _mode : { #Base; #All }) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _mode : { #Base; #All }));
	};

	public query func validatorPairSetOrderFail(_app : Principal, _arg : { #Enable; #Disable }) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _arg : { #Enable; #Disable }));
	};

	public query func validatorPairEnableStratOrder(
		_app : Principal,
		_arg : { #Enable; #Disable },
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_arg : { #Enable; #Disable },
			)
		);
	};

	public query func validatorStoConfig(
		_poFee1 : ?Nat,
		_poFee2 : ?Float,
		_sloFee1 : ?Nat,
		_sloFee2 : ?Float,
		_gridMaxPerSide : ?Nat,
		_proCountMax : ?Nat,
		_stopLossCountMax : ?Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_poFee1 : ?Nat,
				_poFee2 : ?Float,
				_sloFee1 : ?Nat,
				_sloFee2 : ?Float,
				_gridMaxPerSide : ?Nat,
				_proCountMax : ?Nat,
				_stopLossCountMax : ?Nat,
			)
		);
	};

	public query func validatorPairPendingAll(_app : Principal, _page : ?Nat, _size : ?Nat) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _page : ?Nat, _size : ?Nat));
	};

	public query func validatorPairWithdrawCycles(_app : Principal, _amount : Nat) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _amount : Nat));
	};

	public query func validatorPairIctcSetAdmin(
		_app : Principal,
		_admin : Principal,
		_addOrRemove : Bool,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_admin : Principal,
				_addOrRemove : Bool,
			)
		);
	};

	public query func validatorPairIctcClearLog(
		_app : Principal,
		_expiration : ?Int,
		_delForced : Bool,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_expiration : ?Int,
				_delForced : Bool,
			)
		);
	};

	public query func validatorPairIctcRedoTT(
		_app : Principal,
		_toid : Nat,
		_ttid : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_toid : Nat,
				_ttid : Nat,
			)
		);
	};

	public query func validatorPairIctcCompleteTO(
		_app : Principal,
		_toid : Nat,
		_status : SagaTM.OrderStatus,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_toid : Nat,
				_status : SagaTM.OrderStatus,
			)
		);
	};

	public query func validatorPairIctcDoneTT(
		_app : Principal,
		_toid : Nat,
		_ttid : Nat,
		_toCallback : Bool,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_toid : Nat,
				_ttid : Nat,
				_toCallback : Bool,
			)
		);
	};

	public query func validatorPairIctcDoneTO(
		_app : Principal,
		_toid : Nat,
		_status : SagaTM.OrderStatus,
		_toCallback : Bool,
	) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _toid : Nat, _status : SagaTM.OrderStatus, _toCallback : Bool));
	};

	public query func validatorPairIctcRunTO(_app : Principal, _toid : Nat) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _toid : Nat));
	};

	public query func validatorPairIctcBlockTO(_app : Principal, _toid : Nat) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _toid : Nat));
	};

	public query func validatorPairSync(_app : Principal) : async ValidatorResult {
		#Ok(debug_show (_app : Principal));
	};

	public query func validatorPairSetVipMaker(
		_app : Principal,
		_account : Address,
		_rate : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_account : Address,
				_rate : Nat,
			)
		);
	};

	public query func validatorPairRemoveVipMaker(_app : Principal, _account : Address) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _account : Address));
	};

	public query func validatorPairFallbackByTxid(
		_app : Principal,
		_txid : Txid,
		_sa : ?ICDexPrivate.Sa,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_txid : Txid,
				_sa : ?ICDexPrivate.Sa,
			)
		);
	};

	public query func validatorPairCancelByTxid(
		_app : Principal,
		_txid : Txid,
		_sa : ?ICDexPrivate.Sa,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_app : Principal,
				_txid : Txid,
				_sa : ?ICDexPrivate.Sa,
			)
		);
	};

	public query func validatorPairTaSetDescription(_app : Principal, _desc : Text) : async ValidatorResult {
		#Ok(debug_show (_app : Principal, _desc : Text));
	};

	public query func validatorDexAddCompetition(
		_id : ?Nat,
		_name : Text,
		_content : Text,
		_start : Time.Time,
		_end : Time.Time,
		_addPairs : [{
			dex : Text;
			canisterId : Principal;
			quoteToken : { #token0; #token1 };
			minCapital : Nat;
		}],
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_id : ?Nat,
				_name : Text,
				_content : Text,
				_start : Time.Time,
				_end : Time.Time,
				_addPairs : [{
					dex : Text;
					canisterId : Principal;
					quoteToken : { #token0; #token1 };
					minCapital : Nat;
				}],
			)
		);
	};

	public shared func validatorSysWithdraw(
		_token : Principal,
		_tokenStd : TokenStd,
		_to : { owner : Principal; subaccount : ?Blob },
		_value : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_token : Principal,
				_tokenStd : TokenStd,
				_to : { owner : Principal; subaccount : ?Blob },
				_value : Nat,
			)
		);
	};

	public query func validatorSysOrder(
		_token : Principal,
		_tokenStd : TokenStd,
		_value : Nat,
		_pair : Principal,
		_order : OrderPrice,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_token : Principal,
				_tokenStd : TokenStd,
				_value : Nat,
				_pair : Principal,
				_order : OrderPrice,
			)
		);
	};

	public query func validatorSysCancelOrder(_pair : Principal, _txid : ?Txid) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _txid : ?Txid));
	};

	public query func validatorSysConfig(
		_args : {
			aggregator : ?Principal;
			blackhole : ?Principal;
			icDao : ?Principal;
			nftPlanetCards : ?Principal;
			sysToken : ?Principal;
			sysTokenFee : ?Nat;
			creatingPairFee : ?Nat;
			creatingMakerFee : ?Nat;
		}
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_args : {
					aggregator : ?Principal;
					blackhole : ?Principal;
					icDao : ?Principal;
					nftPlanetCards : ?Principal;
					sysToken : ?Principal;
					sysTokenFee : ?Nat;
					creatingPairFee : ?Nat;
					creatingMakerFee : ?Nat;
				}
			)
		);
	};

	public query func validatorMakerReinstall(
		_pair : Principal,
		_maker : Principal,
		_version : Text,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_pair : Principal,
				_maker : Principal,
				_version : Text,
			)
		);
	};

	public query func validatorMakerUpdate(
		_pair : Principal,
		_maker : Principal,
		_name : ?Text,
		_version : Text,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_pair : Principal,
				_maker : Principal,
				_name : ?Text,
				_version : Text,
			)
		);
	};

	public query func validatorMakerUpdateAll(
		_version : Text,
		_updatePrivateMakers : Bool,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_version : Text,
				_updatePrivateMakers : Bool,
			)
		);
	};

	public query func validatorMakerApproveToPair(
		_pair : Principal,
		_maker : Principal,
		_amount : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_pair : Principal,
				_maker : Principal,
				_amount : Nat,
			)
		);
	};

	public query func validatorMakerRemove(_pair : Principal, _maker : Principal) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal, _maker : Principal));
	};

	public query func validatorMakerSetControllers(
		_pair : Principal,
		_maker : Principal,
		_controllers : [Principal],
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_pair : Principal,
				_maker : Principal,
				_controllers : [Principal],
			)
		);
	};

	public query func validatorMakerConfig(_maker : Principal, _config : Maker.Config) : async ValidatorResult {
		#Ok(debug_show (_maker : Principal, _config : Maker.Config));
	};

	public query func validatorMakerTransactionLock(
		_maker : Principal,
		_sysTransactionLock : ?{ #lock; #unlock },
		_sysGlobalLock : ?{ #lock; #unlock },
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_maker : Principal,
				_sysTransactionLock : ?{ #lock; #unlock },
				_sysGlobalLock : ?{ #lock; #unlock },
			)
		);
	};

	public query func validatorMakerSetPause(_maker : Principal, _pause : Bool) : async ValidatorResult {
		#Ok(debug_show (_maker : Principal, _pause : Bool));
	};

	public query func validatorMakerResetLocalBalance(_maker : Principal) : async ValidatorResult {
		#Ok(debug_show (_maker : Principal));
	};

	public query func validatorMakerDexWithdraw(
		_maker : Principal,
		_token0 : Nat,
		_token1 : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_maker : Principal,
				_token0 : Nat,
				_token1 : Nat,
			)
		);
	};

	public query func validatorMakerDexDeposit(
		_maker : Principal,
		_token0 : Nat,
		_token1 : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_maker : Principal,
				_token0 : Nat,
				_token1 : Nat,
			)
		);
	};

	public query func validatorMakerDeleteGridOrder(
		_maker : Principal,
		_gridOrder : { #First; #Second },
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_maker : Principal,
				_gridOrder : { #First; #Second },
			)
		);
	};

	public query func validatorMakerMakerCreate(
		_arg : {
			pair : Principal;
			allow : { #Public; #Private };
			name : Text; //
			lowerLimit : Nat;
			upperLimit : Nat;
			spreadRate : Nat;
			threshold : Nat;
			volFactor : Nat;
			creator : ?AccountId;
		}
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_arg : {
					pair : Principal;
					allow : { #Public; #Private };
					name : Text; //
					lowerLimit : Nat;
					upperLimit : Nat;
					spreadRate : Nat;
					threshold : Nat;
					volFactor : Nat;
					creator : ?AccountId;
				}
			)
		);
	};

	public query func validatorMakerCreateGridOrder(
		_maker : Principal,
		_gridOrder : { #First; #Second },
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_maker : Principal,
				_gridOrder : { #First; #Second },
			)
		);
	};

	public query func validatorMakerCancelAllOrders(_maker : Principal) : async ValidatorResult {
		#Ok(debug_show (_maker : Principal));
	};

	public query func validatorMonitorPut(_canisterId : Principal) : async ValidatorResult {
		#Ok(debug_show (_canisterId : Principal));
	};

	public query func validatorMonitorRemove(_canisterId : Principal) : async ValidatorResult {
		#Ok(debug_show (_canisterId : Principal));
	};

	public query func validatorDebugCanisterStatus(_canisterId : Principal) : async ValidatorResult {
		#Ok(debug_show (_canisterId : Principal));
	};

	public query func validatorTimerStart(_intervalSeconds : Nat) : async ValidatorResult {
		#Ok(debug_show (_intervalSeconds : Nat));
	};

	public query func validatorSysConversionFees(_args : [{ pair : Principal; debitToken : ?{ #token0; #token1 }; approvalSupported : ?Bool }]) : async ValidatorResult {
		#Ok(debug_show (_args : [{ pair : Principal; debitToken : ?{ #token0; #token1 }; approvalSupported : ?Bool }]));
	};

	public query func validatorSysCall(_canisterId : Principal, _methodName : Text, _args : Blob) : async ValidatorResult {
		#Ok(debug_show (_canisterId : Principal, _methodName : Text, _args : Blob));
	};

	/// Trader Validator

	public query func validatorTraderWithdraw(
		_token : Principal,
		_to : ICRC1.Account,
		_value : Nat,
	) : async ValidatorResult {
		#Ok(
			debug_show (
				_token : Principal,
				_to : ICRC1.Account,
				_value : Nat,
			)
		);
	};

	public query func validatorTraderSetWhitelist(_pair : Principal) : async ValidatorResult {
		#Ok(debug_show (_pair : Principal));
	};

	/// Common
	public query func validator() : async ValidatorResult {
		#Ok(debug_show ());
	};

};

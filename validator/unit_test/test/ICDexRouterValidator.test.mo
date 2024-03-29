import { test } "mo:test/async";
import ICDexValidator "../../src/ICDexValidator";
import Principal "mo:base/Principal";
import Array "mo:base/Array";

let validator = await ICDexValidator.ICDexValidator();

actor class Agent(canister : ICDexValidator.ICDexValidator) {
	public func addAdmin(admin : Principal) {
		canister.addAdmin(admin);
	};
};
let agent = await Agent(validator);

await test(
	"addAdmin test",
	func() : async () {
		validator.addAdmin(Principal.fromActor(agent));
		let admins = await validator.getAdmins();
		assert Array.equal(admins, [Principal.fromText("lw2we-tsjiq-5de")], Principal.equal);
	},
);

await test(
	"removeAdmin test",
	func() : async () {
		validator.removeAdmin(Principal.fromActor(agent));
		let admins = await validator.getAdmins();
		assert Array.equal(admins, [], Principal.equal);
	},
);

await test(
	"modifyOwner test",
	func() : async () {
		validator.modifyOwner(Principal.fromActor(agent));
		let owner = await validator.getOwner();
		assert owner == Principal.fromActor(agent);
	},
);

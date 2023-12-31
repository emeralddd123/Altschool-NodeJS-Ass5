const mongoose = require("mongoose");
const { User, Product, Order } = require("./model")


mongoose.connect('mongodb://127.0.0.1:27017/company-x').catch((error) => console.error(error));

const saveUser = async () => {
	try {
		const newUser = new User({
			username: "UsmanAbdulsalam",
			password: "password123",
			email: "fake@gmail.com",
			contact: "Salami",
			phoneNumber: "0905763XXXX",
			gender: "male",
		});

		await newUser.save();
		console.log('User saved successfully.');
	} catch (error) {
		console.error('Error saving user:', error);
	} finally {
		mongoose.connection.close();
	}
};

const saveProduct = async () => {
	try {
		const newProduct = new Product({
			name: "Samsung Galaxy S10",
			description: "fgchjksdjfhgvbdnjsk",
			price: 500.00,
			quantity: 23,
			available: true,
			size: "medium",
			categories: [{ name: "Phones" }, { name: "Gadgets" }]
		})

		await newProduct.save()
		console.log('Product Saved Succesfully')
	} catch (error) {
		console.log(`Eroor saving product ${error}`)
	} finally {
		console.log('Done')
		//mongoose.connection.close()
	}
}

const saveOrder = async () => {
	try {
		const newOrder = new Order({
			userId: "64fbe0ca3e8356460de84a79",
			approval: false,
			orderItems: [{
				productId: "64fbe3fe9d9f0605762cec02",
				quantity: 2,
				unitPrice: 24.89
			}]
		})

		await newOrder.save()
		console.log(`Order Placed Succesfully`)
	} catch (error) {
		console.log(error)
	} finally {
		console.log('done!')
		mongoose.connection.close()
	}
}


// saveUser();
//saveProduct();
//saveOrder();


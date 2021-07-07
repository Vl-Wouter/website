<template>
<div class="py-4">
	<div class="flex justify-between items-baseline mb-4">
		<h3 v-if="type == 'edit'" class="text-lg mb-3">
			Edit "{{ data.name }}"
		</h3>
		<h3 v-else class="text-lg mb-3">
			Add a new Vehicle Category
		</h3>
		<button class="btn btn-primary py-2 px-4" @click="saveItem">
			<span v-show="loading"><i class="pi pi-spinner pi-spin" /></span>
			<span v-show="!loading">Save</span>
		</button>
	</div>
	<form method="post" class="grid grid-cols-2 gap-4 p-8 rounded-md bg-white shadow-md">
		<!-- <pre>{{ invalidFields }}</pre> -->
		<div>
			<label class="block mb-1" for="name">Name</label>
			<input-text v-model="data.name" class="w-full " :class="invalidFields.name && 'p-invalid'" />
			<small v-if="invalidFields.name" class="text-red-600 text-capitalize">{{ invalidFields.name }}</small>
		</div>
		<div>
			<label class="block mb-1" for="priority">Priority</label>
			<input-number
				v-model="data.priority"
				:max="4"
				:min="1"
				class="w-full"
				show-buttons
				button-layout="horizontal"
				:class="invalidFields.priority && 'p-invalid'"
			/>
			<small v-if="invalidFields.priority" class="text-red-600 text-capitalize">{{ invalidFields.priority }}</small>
		</div>
		<div>
			<label for="dates" class="block mb-1">Event duration</label>
			<calendar v-model="data.dates" class="w-full" selection-mode="range" :show-icon="true" date-format="dd MM yy" />
			<small v-if="invalidFields.dates" class="text-red-600 text-capitalize">{{ invalidFields.dates }}</small>
		</div>
		<div>
			<label class="block mb-1" for="name">Logo</label>
			<input-text v-model="data.logo" class="w-full " :class="invalidFields.logo && 'p-invalid'" />
			<small v-if="invalidFields.logo" class="text-red-600 text-capitalize">{{ invalidFields.logo }}</small>
		</div>
	</form>
</div>
</template>

<script>
import InputText from 'primevue/inputtext';
import InputNumber from 'primevue/inputnumber';
import Calendar from 'primevue/calendar';

export default {
	components: { InputText, InputNumber, Calendar },
	layout: 'admin',
	middleware: 'auth',
	async asyncData({ $axios, params }) {
		if (typeof parseInt(params.id) === 'number')
			try {
				const res = await $axios.$get('/api/event/' + params.id);
				return {
					type: 'edit',
					data: {
						...res,
						dates: [
							res.startdate,
							res.enddate
						]
					}
				};
			} catch (err) {
				return {
					type: 'new'
				};
			} else
			return {
				type: 'new'
			};
	},
	data() {
		return {
			type: 'new',
			data: {
				name: '',
				priority: 1,
				startdate: null,
				enddate: null,
				sessions: []
			},
			invalidFields: {},
			loading: false
		};
	},
	methods: {
		validateItem() {
			let valid = true;
			const requiredFields = [
				'name'
			];

			for (const field of requiredFields)
				if (!this.data[field]) {
					valid = false;
					this.invalidFields[field] = `${field} is required`;
				}

			return valid;
		},
		async saveItem() {
			this.loading = true;
			const valid = this.validateItem();
			if (!valid) {
				this.loading = false;
				return;
			}
			try {
				if (this.data.id)
					await this.$axios.put(`/api/event/${this.data.id}`, this.data);
				else
					await this.$axios.post('/api/event', this.data);

				this.$router.push('/admin/event');
			} catch (err) {
				console.log(err);
				this.$toast.add({ severity: 'error', summary: 'Oh no!', detail: 'Something went wrong while creating/updating a vehicle category.', life: 5000 });
			} finally {
				this.loading = false;
			}
		}
	}
};
</script>

<style scoped lang="scss">
.p-autocomplete-multiple-container {
	width: 100% !important;
}
</style>
